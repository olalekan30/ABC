using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Security;
using System.IO;
using System.Security.Cryptography.X509Certificates;


/// <summary>
/// Summary description for util
/// </summary>
public class util
{
     smartcon con = new smartcon();
     string UploadLog, filename;
    /// <summary>
    /// Sets the cert policy.
    /// </summary>
    public const string ALL_NUMERIC_PATTERN = "[0-9]";
    public static readonly Regex All_Numeric_Regex = new Regex(ALL_NUMERIC_PATTERN);


    /// <summary>
    /// Remotes the certificate validate.
    /// </summary>
    /// 



    public void insertError(string msg)
    {
        try
        {
            
            StreamWriter strWriterlog = default(StreamWriter);
            UploadLog = Convert.ToString(ConfigurationManager.AppSettings["ErrorLog"]);
            if (!System.IO.Directory.Exists(UploadLog))
            {
                System.IO.Directory.CreateDirectory(UploadLog);
            }

            filename = "log" + DateTime.Now.ToString("ddMMyyyy") + ".txt";
            filename = string.Concat(UploadLog, "\\", filename);
            strWriterlog = new StreamWriter(filename, true);
            strWriterlog.WriteLine(msg + " " + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            strWriterlog.Close();

        }
        catch
        {
        }

    }

}
