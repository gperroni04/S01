(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 20 :bruxas 3))
         (homura (make-garota-magica :nome "Homura" :escuridao 65 :bruxas 18))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 50 :bruxas 5))
         (grupo (list madoka homura sayaka)))

    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas: ~a~%" (total-de-bruxas grupo))

    (format t "Digite o nome da nova garota (entre aspas): ")
    (let* ((nome-nova (read))
           (nova (make-garota-magica :nome nome-nova :escuridao 30 :bruxas 2))
           (grupo-novo (cons nova grupo)))
      (format t "Escuridao total do grupo antigo: ~a~%" (escuridao-total grupo))
      (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo)))

    (format t "Digite a quantidade para purificar ~a: " (garota-magica-nome homura))
    (let* ((qtd (read))
           (homura-limpa (purifica homura qtd)))
      (format t "Escuridao de ~a (original): ~a~%"
              (garota-magica-nome homura)
              (garota-magica-escuridao homura))
      (format t "Escuridao de ~a (nova): ~a~%"
              (garota-magica-nome homura-limpa)
              (garota-magica-escuridao homura-limpa)))))

(main)
