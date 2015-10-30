class fraccion
   
   attr_reader :numerador, :denominador
   
    def initialize(numerador,denominador)
        max_com_div = gcd(numerador, denominador)
        if(denominador != 0)
            @numerador = numerador
            @denominador = denominador
        end
            #simplificamos la fraccion con el max_com_div
            @numerador, @denominador = numerador/max_com_div, denominador/max_com_div
    end
    
      #maximo comu divisior
     def gcd(n, d)
         n1,n2 = n.abs,d.abs
         gcd = 1
         k = 1
         while (k <= n1 and k <= n2)
              if (n1 % k == 0 and n2 % k == 0)
                  gcd = k
              end
              k += 1
         end
         return gcd
     end
   
      #metodo para hallar el minimo comun multiplo de los dos numeros pasados como parametros
     def mcm(a,b)
        #mediante el metodo de euclides, resolvemos el minimo comun multiplo mediante el
        #maximo comun divisor
        aux=gcd(a,b)
        (a/aux)*b
     end
    
    #mostrar con formato por consola
    def to_s
        "(#{@numerador}/#{@denominador})"
    end
    
    #MULTIPLICAR
     def *(fraccion)
        fraccion.new(@numerador * fraccion.numerador, @denominador * fraccion.denominador)
     end
     
    #DIVISION
    def /(fraccion)
        fraccion.new(@numerador / fraccion.numerador, @denominador / fraccion.denominador)
    end
     
     #RESTAR
     def -(fraccion)
      #    Point.new(@x * -1, @y * -1)
      
        aux = mcm(@denominador, fraccion.denominador)
        fraccion.new((((aux*@numerador)/@denominador)-(aux*fraccion.numerador)/fraccion.denominador),aux)
     end
    
    #SUMAR
     def + (fraccion)
       # Point.new(@x + fraccion. x, @y + fraccion.y)
        aux = mcm(@denominador, fraccion.denominador)
        fraccion.new((((aux*@numerador)/@denominador)+(aux*fraccion.numerador)/fraccion.denominador),aux)
       
     end
    
end