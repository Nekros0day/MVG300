#include <cmath>
#include <iostream>
using namespace std;

// datatype for quaternion
struct quaternion {
    double re, iim, jim, kim;
};

// Addition
quaternion qadd(quaternion q1, quaternion q2)
{
    quaternion sum;
    sum.re = q1.re + q2.re;
    sum.iim = q1.iim + q2.iim;
    sum.jim = q1.jim + q2.jim;
    sum.kim = q1.kim + q2.kim;
    return sum; 
}
// Subtraction
quaternion qsub(quaternion q1, quaternion q2)
{
    quaternion sub;
    sub.re = q1.re - q2.re;
    sub.iim = q1.iim - q2.iim;
    sub.jim = q1.jim - q2.jim;
    sub.kim = q1.kim - q2.kim;
    return sub; 
}

// Multiplication
quaternion qmul(quaternion q1, quaternion q2)
{
    quaternion prod;
    prod.re = q1.re * q2.re - q1.iim * q2.iim - q1.jim * q2.jim - q1.kim * q2.kim;
    prod.iim = q1.re * q2.iim + q1.iim * q2.re + q1.jim * q2.kim - q1.kim * q2.jim;
    prod.jim = q1.re * q2.jim - q1.iim * q2.kim + q1.jim * q2.re + q1.kim * q2.iim;
    prod.kim = q1.re * q2.kim + q1.iim * q2.jim - q1.jim * q2.iim + q1.kim * q2.re;
    return prod; 
}

// Inverse
quaternion qinv(quaternion q1)
{
    quaternion inv;
    inv.re = q1.re / (pow(q1.re, 2) + pow(q1.iim, 2) + pow(q1.jim, 2) + pow(q1.kim, 2));
    inv.iim = -q1.iim / (pow(q1.re, 2) + pow(q1.iim, 2) + pow(q1.jim, 2) + pow(q1.kim, 2));
    inv.jim = -q1.jim / (pow(q1.re, 2) + pow(q1.iim, 2) + pow(q1.jim, 2) + pow(q1.kim, 2));
    inv.kim = -q1.kim / (pow(q1.re, 2) + pow(q1.iim, 2) + pow(q1.jim, 2) + pow(q1.kim, 2));
    return inv; 
}

// Division
quaternion qdiv(quaternion q1, quaternion q2)
{
    quaternion div;
    div = qmul(q1, qinv(q2));
    return div; 
}

// Conjugate
quaternion qconj(quaternion q1)
{
    quaternion conj;
    conj.re = q1.re;
    conj.iim = q1.iim*(-1);
    conj.jim = q1.jim*(-1);
    conj.kim = q1.kim*(-1);
    return conj; 
}

// Absolute
double qabs(quaternion q1)
{   
    double abs;
    abs = pow((pow(q1.re, 2) + pow(q1.iim, 2) + pow(q1.jim, 2) + pow(q1.kim, 2)), 0.5);
    return abs; 
}



// Construct
quaternion qcons(double a, double b, double c, double d)
{
    quaternion cons;
    cons.re = a;
    cons.iim = b;
    cons.jim = c;
    cons.kim = d;
    return cons; 
}

// Read
quaternion qread()
{
    quaternion read;
    cout << "Construct a quaternion" << endl;
    cin >> read.re >> read.iim >> read.jim >> read.kim;
    return read; 
}

// Print out
void qprint(string statq, quaternion q1)
{
    cout << statq << "(" << q1.re << "," << q1.iim << "," << q1.jim << "," << q1.kim << ")" << endl;
}

int main()
{
    quaternion q, r, s;
    double theta2 = M_PI / 4.0;
    q = qcons(cos(theta2), sin(theta2), 0, 0);
    r = qcons(0, 0, 1, 0);
    qprint("s calculation: ", qdiv(qmul(q, r), q));
    // or
    s = qdiv(qmul(q, r), q);
    qprint("(or) s calculation: ", s);

    // check reading
    quaternion cinConstq = qread();
    qprint("you constructed: ", cinConstq);

    // Conjugate readin 
    qprint("Conjugate cin quaternion: ", qconj(cinConstq));

    // check if qdiv(q, q) is equcal to one
    qprint("q/q: ", qdiv(q, q));

    // check if qsub(q, q) is equcal to zero
    qprint("q-q: ", qsub(q, q));
    
    // check if qmul(q, qinv(q)) is equcal to one
    qprint("q*q^-1: ", qmul(q, qinv(q)));

    // check if qabs(q) is equcal to one
    cout << "|q|: " << qabs(q) << endl;

    // check construction
    qprint("constructed: ", qcons(1, 0 , 1, 1));

    // more tests ...

    return 0;
}

