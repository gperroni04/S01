(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peixe-Bexiga" :bioma "Safe Shallows" :profundidade 20 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Kelp Forest" :profundidade 80 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunes" :profundidade 250 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Lost River" :profundidade 650 :perigo :leviata)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a) - ~am - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (format t "--- Todas as criaturas ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (format t "Digite a profundidade em metros: ")
  (let* ((limite (read))
         (filtradas (abaixo-de limite *catalogo*)))
    (format t "--- Criaturas abaixo de ~am ---~%" limite)
    (dolist (texto (mapcar #'descreve-criatura filtradas))
      (format t "~a~%" texto))
    (format t "Total abaixo de ~am: ~a~%" limite (length filtradas))))

(main)
