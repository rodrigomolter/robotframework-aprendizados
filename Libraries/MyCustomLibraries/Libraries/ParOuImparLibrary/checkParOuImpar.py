def numero_par_ou_impar(num):
    if (num % 2) == 0:
        print("{0} é par".format(num))
        return "par"
    else:
        print("{0} é impar".format(num))
        return "impar"