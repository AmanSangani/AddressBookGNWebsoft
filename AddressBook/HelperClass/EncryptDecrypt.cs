using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace AddressBook.HelperClass
{
    public static class EncryptDecrypt
    {
        #region Encrypt
        public static string encrypt(string encryptString)
        {
            string EncryptionKey = "Aman@1310";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using(Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using(MemoryStream ms = new MemoryStream())
                {
                    using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    byte[] encryptedBytes = ms.ToArray();
                    return BitConverter.ToString(encryptedBytes).Replace("-", "").ToLower(); // Convert to hex and ensure lowercase
                }
            }
        }
        #endregion Encrypt

        #region Decrypt
        public static string Decrypt(string cipherText)
        {
            string EncryptionKey = "Aman@1310";
            int numChars = cipherText.Length;
            byte[] cipherBytes = new byte[numChars / 2];
            for(int i = 0; i < numChars; i += 2)
            {
                cipherBytes[i / 2] = Convert.ToByte(cipherText.Substring(i, 2), 16); // Convert hex back to byte array
            }
            using(Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using(MemoryStream ms = new MemoryStream())
                {
                    using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    return Encoding.Unicode.GetString(ms.ToArray());
                }
            }
        }
        #endregion Decrypt


    }
}