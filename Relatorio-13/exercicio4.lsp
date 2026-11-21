(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not
                      (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                      lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~a - Recompensa: ~,1f mora"
                            (dominio-nome d)
                            (recompensa-final d)))
                  filtrados)))
    textos))

(defun main ()
  (let* ((d1 (make-dominio :nome "Vale Esquecido" :elemento :cryo :dificuldade 2 :mora 1800))
         (d2 (make-dominio :nome "Palacio Oculto de Zhou" :elemento :pyro :dificuldade 4 :mora 2500))
         (d3 (make-dominio :nome "Jardim de Verao" :elemento :electro :dificuldade 3 :mora 2000))
         (d4 (make-dominio :nome "Canhao Claro" :elemento :hydro :dificuldade 1 :mora 1500))
         (d5 (make-dominio :nome "Torre da Desatencao" :elemento :anemo :dificuldade 5 :mora 3000))
         (dominios (list d1 d2 d3 d4 d5)))

    (format t "Digite a dificuldade maxima (1 a 5): ")
    (let ((dif-max (read)))
      (format t "--- Rota ---~%")
      (dolist (item (rota dominios dif-max))
        (format t "~a~%" item)))

    (format t "Total de mora da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (let ((copia (copy-dominio d1)))
      (setf (dominio-mora copia) 5000)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora d1)))))

(main)
