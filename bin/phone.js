#!/usr/bin/env node

const { HOME } = process.env
const { spawnSync, spawn } = require('child_process')
const exe = (...cmd) => {
  const { status, error, stderr, stdout } = spawnSync(cmd[0], cmd.slice(1));
  if (stderr.length > 0 || error || status !== 0) {
    throw new Error(`Failed to execute command: ${JSON.stringify(cmd)}\nExit code: ${status}\nError: ${error}\nStandard error output:\n${stderr}`)
  }
  return stdout.toString()
}
const exeStream = (...cmd) => new Promise((resolve, reject) => {
  const childProcess = spawn(cmd[0], cmd.slice(1));
  let stderrString = ''
  childProcess.stderr.on('data', (data) => stderrString += data)
  childProcess.stdout.on('data', (data) => process.stdout.write(data))
  const createError = ({status, error}) => new Error(`Failed to execute command: ${JSON.stringify(cmd)}\nExit code: ${status}\nError: ${error}\nStandard error output:\n${stderrString}`)
  childProcess.on('close', status => {
    if (status === 0) {
      resolve()
    } else {
      reject(createError({status}))
    }
  })
  childProcess.on('error', err => reject(createError({error: err})))
})
const exeLog = (...cmd) => console.log(`# ${process.cwd()} ${JSON.stringify(cmd)}\n${exe(...cmd).trim()}`)
const exeLines = (...cmd) => exe(...cmd).trim().split('\n').filter(Boolean)
;(async () => {
  exe('jmtpfs', `${HOME}/etc/phone`)
  exe('sleep', '2')

  const storageDir = `${HOME}/etc/phone/Internal shared storage`
  const photosDir = `${HOME}/etc/root/people/me/photos/${exeLines('date', '-I')[0]}`
  exe('mkdir', '-p', photosDir)
  const callsDir = `${HOME}/etc/root/my/calls`
  const smsDir = `${HOME}/etc/root/my/sms`
  const downloadsDir = `${storageDir}/Download`
  const callRecordsDir = `${storageDir}/MIUI/sound_recorder/call_rec`
  const downloads = exeLines('ls', downloadsDir)
  const smsLog = downloads.filter(fileName => fileName.startsWith('sms-'))[0]
  const callsLog = downloads.filter(fileName => fileName.startsWith('calls-'))[0]
  const callRecords = exeLines('ls', callRecordsDir)
  const photoDirs = ['DCIM', 'Telegram', 'WhatsApp/Media', 'Slack', 'Movies', 'Pictures'].map(dir => `${storageDir}/${dir}`)
  console.log('removing thumbnails')
  exeLog('rm', '-rf', `${storageDir}/DCIM/.thumbnails`)
  console.log('listing photos')
  const photos = exeLines('find', ...photoDirs, '-type', 'f')

  if (callsLog) {
    exeLog('mv', '-nv', `${downloadsDir}/${callsLog}`, callsDir)
  }
  if (smsLog) {
    exeLog('mv', '-nv', `${downloadsDir}/${smsLog}`, smsDir)
  }
  callRecords.forEach(callRecord => {
    exeLog('mv', '-nv', `${callRecordsDir}/${callRecord}`, callsDir)
  })
  photos.forEach(photo => {
    exeLog('mv', '-nv', photo, photosDir)
  })
  exe('sudo', 'umount', `${HOME}/etc/phone`)

  if (smsLog) {
    process.chdir(smsDir)
    exeLog('root', 'send', smsLog)
  }
  process.chdir(callsDir)
  if (callsLog) {
    exeLog('root', 'send', callsLog)
  }
  callRecords.forEach(callRecord => {
    exeLog('root', 'send', callRecord)
  })
  process.chdir(photosDir)
  await exeStream('root', 'send', '.')
})().catch(err => {
  console.log('Failed')
  console.log(err.stack)
  process.exit(1)
})
