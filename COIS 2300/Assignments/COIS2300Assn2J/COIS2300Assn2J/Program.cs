using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

namespace COIS2300Assn2J
{
    class Program
    {
        public class minifloat // you need to convert to this
        {
            public int sign;
            public string Exponent;
            public int exponent;
            public string Mantissa;
            public float mantissa;
            static int bias = 7;
            public static float number1, number2;
            
            public minifloat(int number, int sign, string exponentbinary, string Mantissa,int exponent)
            {
                this.sign = sign;
                this.Exponent = exponentbinary;
                this.Mantissa = Mantissa;
                this.exponent = exponent;
                Console.WriteLine("--------------------------------------------------------------------------------------------------------");
                Console.WriteLine("\nThe number " + number + " is: " + sign + " " + Exponent + " 1." + Mantissa + " of form sign exponent mantissa with 1");

                for (int i=0;i<Mantissa.Length;i++)
                {
                    mantissa = (float)(Mantissa[i]/Math.Pow(10,i+1));
                }

                float finalnumber = (float)(Math.Pow(-1, this.sign) * Math.Pow(10, (this.exponent - bias)) * (1+mantissa));
                Console.WriteLine("The number in floating number : " + finalnumber);

                if (number == 1)
                    number1 = finalnumber;
                else
                    number2 = finalnumber;
            }

            public static float addition()
            {
                return number1 + number2;
            }

            public static float subtraction()
            {
                return number1 - number2;
            }

            public static float multiplication()
            { 
                return number1* number2;
            }

            public static float division()
            {
                return number1 / number2;
            }
        }
        public class RawDecimal // for reading in the values, mostly for demonstration purposes
        {
            public int sign;
            public int wholepart;
            public int decimalpart;
            public int exponent;

        }
        public static void Main(string[] args)
        {
            double number1, number2;
            RawDecimal sampleRawDecimal1 = new RawDecimal();
            RawDecimal sampleRawDecimal2 = new RawDecimal();

            using (TextReader reader = File.OpenText("numbers.txt"))
            {
              
                sampleRawDecimal1.sign = int.Parse(reader.ReadLine());
                sampleRawDecimal1.wholepart = int.Parse(reader.ReadLine());
                sampleRawDecimal1.decimalpart = int.Parse(reader.ReadLine());
                sampleRawDecimal1.exponent = int.Parse(reader.ReadLine());
                sampleRawDecimal2.sign = int.Parse(reader.ReadLine());
                sampleRawDecimal2.wholepart = int.Parse(reader.ReadLine());
                sampleRawDecimal2.decimalpart = int.Parse(reader.ReadLine());
                sampleRawDecimal2.exponent = int.Parse(reader.ReadLine());
            }

            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // Showing that it has read the files 

            Console.WriteLine("Firstnum Sign: " + sampleRawDecimal1.sign + " Wholepart: " + sampleRawDecimal1.wholepart + " Decimal Part: " + sampleRawDecimal1.decimalpart + " Exponent: " + sampleRawDecimal1.exponent);
            Console.WriteLine("Firstnum Sign: " + sampleRawDecimal2.sign + " Wholepart: " + sampleRawDecimal2.wholepart + " Decimal Part: " + sampleRawDecimal2.decimalpart + " Exponent: " + sampleRawDecimal2.exponent);
 
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //decimal number in decimal form using whole part and fraction part
            number1 = (double)(sampleRawDecimal1.wholepart) + (double)(sampleRawDecimal1.decimalpart / Math.Pow(10,sampleRawDecimal1.decimalpart.ToString().Length));
            number2 = (double)(sampleRawDecimal2.wholepart) + (double)(sampleRawDecimal2.decimalpart / Math.Pow(10,sampleRawDecimal2.decimalpart.ToString().Length));

  //////////////////////////////////To binary for mantessa///////////////////////////////////////////////////////////////

            double n1 = number1, n2 = number2;
            string mantessa1 = "", mantessa2 = "";

            while (n1 >= 2)
            {
                n1 = n1 / 2;
            }
            double raw1 = n1 - 1;
            raw1 = Math.Round(raw1, 2);
            mantessa1 = ToBinaryFraction(raw1);

            while (n2 >= 2)
            {
                n2 = n2 / 2;
            }
            double raw2 = n2 - 1;
            raw2 = Math.Round(raw2,3);
            mantessa2 = ToBinaryFraction(raw2);

            string ToBinaryFraction(double raw)
            {
                int mantessa = 0;
                List<int> r = new List<int>();
                for (int i = 0; i < 3; i++)
                {
                    r.Add((int)(raw * 2));
                    raw = (raw * 2) - (int)(raw * 2);
                    raw = Math.Round(raw, 2);
                }
                for (int i = 0; i < r.Count; i++)
                {
                    mantessa += (int)(r[i] * Math.Pow(10, r.Count - 1 - i));
                }

                char[] mantarray = mantessa.ToString().ToCharArray();
                string mant = "";
                if (mantessa.ToString().Length < 3)
                {
                    for (int i = 0; i <= (2 - mantarray.Length); i++)
                    {
                        mant += "0";
                    }
                    foreach (char k in mantarray)
                        mant += k;
                }
                return mant;
            }
/////////////////////////////exponent to binary/////////////////////////////////////////////////////
            string exponent1 = "", exponent2 = "";
            exponent1 = ToBinaryInteger(sampleRawDecimal1.exponent);
            exponent2 = ToBinaryInteger(sampleRawDecimal2.exponent);
            
            string ToBinaryInteger(int exp)
            {
                int expo=0;
                List<int> e = new List<int>();
                for(int i=0; i<4; i++)
                {
                    e.Add(exp % 2);
                    exp = (int)(exp / 2);
                }
                for(int i=e.Count-1;i>=0;i--)
                {
                    expo += (int)(e[i] * Math.Pow(10, i));
                }
                char[] exparray = expo.ToString().ToCharArray();
                string exponent = "";
                if (expo.ToString().Length < 4)
                {
                    for (int i = 0; i <= (3 - exparray.Length); i++)
                    {
                        exponent += "0";
                    }
                    foreach (char k in exparray)
                        exponent += k;
                }
                return exponent;
            }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //calling minifloat class
            minifloat numfirst = new minifloat(1,sampleRawDecimal1.sign, exponent1, mantessa1,sampleRawDecimal1.exponent);
            minifloat numsecond = new minifloat(2,sampleRawDecimal2.sign, exponent2, mantessa2,sampleRawDecimal2.exponent);
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Console.WriteLine("--------------------------------------------------------------------------------------------------------");
            Console.WriteLine("\nConverting them to floats now and doing addition, subtraction, multiplication, and division");

            Console.WriteLine("\nAddition Sum : " + minifloat.addition());
            Console.WriteLine("\nSubtraction Difference : " + minifloat.subtraction());
            Console.WriteLine("\nMultiplication Product : " + minifloat.multiplication());
            Console.WriteLine("\nDivision Quotient : " + minifloat.division());

            Console.ReadLine();
        }
    }
}
