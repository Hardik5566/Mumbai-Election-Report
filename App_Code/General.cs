using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for General
/// </summary>
public class General
{
    public General()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string rename_file_name(string file_name)
    {

        if (file_name != "")
        {
            string ext = Path.GetExtension(file_name);
            file_name = Path.GetFileNameWithoutExtension(file_name);

            file_name = DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + System.Text.RegularExpressions.Regex.Replace(file_name, @"[^0-9a-zA-Z]+", "") + ext;
        }

        return file_name;
    }

    public static string save_file_from_base64(string file_name, string base64, string save_path)
    {
        string name = "";

        if (file_name != "")
        {

            string ext = Path.GetExtension(file_name);
            file_name = Path.GetFileNameWithoutExtension(file_name);

            file_name = DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + System.Text.RegularExpressions.Regex.Replace(file_name, @"[^0-9a-zA-Z]+", "") + ext;



            byte[] bytes = Convert.FromBase64String(base64);

            string path = save_path + file_name;
            File.WriteAllBytes(path, bytes);

            name = file_name;

        }

        return name;
    }



    public static void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }


    public static string ImageToBase64(string image_path)
    {

        string base64String = "";
        using (System.Drawing.Image image = System.Drawing.Image.FromFile(image_path))
        {
            using (MemoryStream m = new MemoryStream())
            {
                image.Save(m, image.RawFormat);
                byte[] imageBytes = m.ToArray();
                base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }
    }

    public static string get_full_standard(string snd)
    {
        string snd_full = "";
        switch (snd)
        {
            case "11A":
                snd_full = "11 Arts";
                break;
            case "11C":
                snd_full = "11 Commerce";
                break;
            case "11S":
                snd_full = "11 Science";
                break;
            case "12A":
                snd_full = "12 Arts";
                break;
            case "12C":
                snd_full = "12 Commerce";
                break;
            case "12S":
                snd_full = "12 Science";
                break;
            default:
                snd_full = snd;
                break;
        }

        return snd_full;
    }

    public static string get_full_medium(string med)
    {
        string med_full = "";
        switch (med.ToLower())
        {
            case "g":
                med_full = "Gujarati";
                break;
            case "e":
                med_full = "English";
                break;
            default:
                med_full = med;
                break;
        }

        return med_full;
    }

    public static bool IsDateTime(string text)
    {
        DateTime dateTime;
        bool isDateTime = false;

        // Check for empty string.
        if (string.IsNullOrEmpty(text))
        {
            return false;
        }

        isDateTime = DateTime.TryParse(text, out dateTime);

        return isDateTime;
    }


}