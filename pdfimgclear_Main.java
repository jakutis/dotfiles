import org.apache.pdfbox.exceptions.COSVisitorException;
import java.awt.image.*;
import java.util.*;
import org.apache.pdfbox.pdmodel.graphics.xobject.*;
import org.apache.pdfbox.pdmodel.common.*;
import org.apache.pdfbox.pdfwriter.*;
import org.apache.pdfbox.pdfparser.*;
import org.apache.pdfbox.util.*;
import org.apache.pdfbox.cos.*;
import org.apache.pdfbox.exceptions.CryptographyException;
import org.apache.pdfbox.exceptions.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentCatalog;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDResources;
import java.io.IOException;

public class Main {
    public static void main(String[] argv) throws Exception {
        clear(argv[0], argv[1]);
    }

    public static void clear(String infile, String outfile) throws COSVisitorException, InvalidPasswordException, CryptographyException, IOException {
        BufferedImage img = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
        img.setRGB(0, 0, 0);

        PDDocument document = PDDocument.load(infile);
        for (Object page : document.getDocumentCatalog().getAllPages()) {
            PDResources resources = ((PDPage)page).findResources();
            COSDictionary dictResources = resources.getCOSDictionary();
            Iterator<String> iter = resources.getImages().keySet().iterator();
            while(iter.hasNext()) {
                setObject(dictResources, COSName.getPDFName(iter.next()), new PDPixelMap(document, img));
            }
        }

        document.save(outfile);
    }

    public static boolean setObject(COSDictionary d, COSName name, COSObjectable obj) {
        for(COSName key : d.keySet()) {
            if(name.equals(key)) {
                d.setItem(key, obj);
                return true;
            }
            COSBase object = d.getDictionaryObject(key);
            if(object instanceof COSDictionary) {
                if(setObject((COSDictionary)object, name, obj)) {
                    return true;
                }
            }
        }
        return false;
    }
}
