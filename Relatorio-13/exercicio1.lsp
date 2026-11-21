(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f/g - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar a erva em si mesma antes de liberar."
      "Erva liberada para o paciente."))

(defun main ()
  (let* ((erva1 (make-erva :nome "Veneno de Sapo" :preco-por-grama 25.0 :toxicidade 9))
         (erva2 (make-erva :nome "Flor de Lua" :preco-por-grama 12.5 :toxicidade 5))
         (erva3 (make-erva :nome "Camomila" :preco-por-grama 4.0 :toxicidade 2))
         (ervas (list erva1 erva2 erva3)))

    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))

    (format t "Digite a quantidade de gramas para calcular a dose de ~a: " (erva-nome erva2))
    (let ((gramas (read)))
      (format t "Preco da dose (~a g): R$~,2f~%" gramas (preco-da-dose erva2 gramas)))))

(main)
