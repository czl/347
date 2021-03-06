CREATE OR REPLACE PROCEDURE update_invoices_credit_total
(
  invoice_number_param VARCHAR2,
  credit_total_param   NUMBER    DEFAULT 100
)
AS
BEGIN
  UPDATE invoices
  SET credit_total = credit_total_param
  WHERE invoice_number = invoice_number_param;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END;
/

CALL update_invoices_credit_total('367447', 200);

SELECT invoice_number, credit_total 
FROM invoices WHERE invoice_number = '367447';

CALL update_invoices_credit_total('367447');

SELECT invoice_number, credit_total 
FROM invoices WHERE invoice_number = '367447';

CALL update_invoices_credit_total('367447', 0);

SELECT invoice_number, credit_total 
FROM invoices WHERE invoice_number = '367447';