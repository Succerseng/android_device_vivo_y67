import java.io.*;
import java.nio.file.Files;
import java.util.TreeSet;

/**
 * 格式化一个文件
 */
public class FormatFileUtils {
    /**
     * 判断某字符串是否符合要求
     *
     * @param allowEmpty 允许为空
     * @param allowNotes 允许为注释
     */
    private static boolean isAccordWithFormatRule(String string, boolean allowEmpty, boolean allowNotes) {
        boolean flag = allowEmpty || !string.isEmpty();
        if (!allowNotes && string.startsWith("#")) flag = false;
        return flag;
    }

    /**
     * format a line
     * xx ,xxx to xx,xxx
     * x,xxx to x, xxx
     *
     * @param string
     * @return
     */

    private static String formatComma(String string) {
        int i = 0;
        // xx ,xxx to xx,xxx
        do {
            i = string.indexOf(',', i);
            if (i > 0 && string.charAt(i - 1) == ' ') {
                // remove probable exists spaces before ,
                int j = i;
                while (j > 0 && string.charAt(j - 1) == ' ') j--;

                string = string.substring(0, j).concat(string.substring(i));
            }
        } while ((i = string.indexOf(',', i + 1)) != -1);            // next comma

        i = 0;
        // x,xxx to x, xxx
        do {
            // search a comma
            i = string.indexOf(',', i);

            // if next char not a space, then add a space after this
            if (i < string.length() - 1 && string.charAt(i + 1) != ' ')
                string = string.substring(0, i + 1).concat(" " + string.substring(i + 1));
        } while ((i = string.indexOf(',', i + 1)) != -1);            // next comma

        return string;
    }

    /**
     * format a line brackets
     * xx (xxx to xx(xxx
     * xx( xxx to xx(xxx
     * xx )xxx to xx)xxx
     *
     * @param string
     * @return
     */

    private static String formatBrackets(String string) {
        int i;

        i = 0;
        // xx (xxx to xx(xxx
        do {
            i = string.indexOf('(', i);
            if (i > 0 && string.charAt(i - 1) == ' ') {
                // remove probable exists spaces before ')'
                int j = i;
                while (j > 0 && string.charAt(j - 1) == ' ') j--;

                string = string.substring(0, j).concat(string.substring(i));
            }
        } while ((i = string.indexOf('(', i + 1)) != -1);            // next bracket

        i = 0;
        // xx )xxx to xx)xxx
        do {
            i = string.indexOf(')', i);
            if (i > 0 && string.charAt(i - 1) == ' ') {
                // remove probable exists spaces before ')'
                int j = i;
                while (j > 0 && string.charAt(j - 1) == ' ') j--;

                string = string.substring(0, j).concat(string.substring(i));
            }
        } while ((i = string.indexOf(')', i + 1)) != -1);            // next bracket

        i = 0;
        // x( xxx to x(xxx
        do {
            // search a bracket
            i = string.indexOf('(', i);

            // if next char not a space, then add a space after this
            if (i < string.length() - 1 && string.charAt(i + 1) == ' ') {
                int j = i + 1;
                while (j < string.length() - 1 && string.charAt(j) == ' ') j++;

                string = string.substring(0, i + 1).concat(string.substring(j));
            }
        } while ((i = string.indexOf('(', i + 1)) != -1);            // next bracket

        return string;
    }

    /**
     * 格式化一个文件
     *
     * @param file       目标文件
     * @param allowEmpty 允许为空
     * @param allowNotes 允许为注释
     */
    public static void formatFile(File file, boolean allowEmpty, boolean allowNotes, boolean notFormatComma,boolean notFormatBrackets) throws IOException {
        // source file
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Files.newInputStream(file.toPath())));
        BufferedWriter bufferedWriter;

        // use tree set to store text
        TreeSet<String> treeSet = new TreeSet<>();

        // read all line and store to tree set collection
        while (true) {
            String string = bufferedReader.readLine();
            if (string == null) break;

            // replace tab to space
            string = string.replace('\t', ' ');

            // if not accord with rule will ignore
            if (!isAccordWithFormatRule(string, allowEmpty, allowNotes)) continue;

            // let "xxx, xxx" not "xxx ,xxx" or "xxx , xxx"
            if (!notFormatComma) string = formatComma(string);

            if (!notFormatBrackets) string = formatBrackets(string);

            treeSet.add(string);
        }
        bufferedReader.close();

        // write back to file
        bufferedWriter = new BufferedWriter(new OutputStreamWriter(Files.newOutputStream(file.toPath())));
        String lastLine = null;
        for (String next : treeSet) {
            // auto \n according to '/'
            if (lastLine != null) {
                int i1 = lastLine.indexOf("/", 1);
                int i2 = next.indexOf("/", 1);
                if (i1 != -1 && i2 != -1 && !lastLine.substring(0, i1).equals(next.substring(0, i2)))
                    bufferedWriter.newLine();
            }

            bufferedWriter.write(next);
            bufferedWriter.newLine();
            bufferedWriter.flush();
            lastLine = next;
        }
        bufferedWriter.close();
    }
}
