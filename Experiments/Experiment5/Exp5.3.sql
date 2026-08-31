DO
 $$
DECLARE 
AGE =19;
BEGIN
IF AGE>=18 THEN 
RAISE NOTICE 'You are eligible to vote.',AGE;
END IF;
RAISE NOTICE 'You are inside end block';
END ;
$$

DO
 $$
DECLARE 
AGE =19;
BEGIN
IF AGE>=18 THEN 
RAISE NOTICE 'You are eligible to vote.',AGE;
ELSE 
RAISE NOTICE 'You are not eligible to vote.',AGE;
END IF;
RAISE NOTICE 'You are inside end block';
END ;
$$

DO
 $$
DECLARE 
val=12;
BEGIN
IF val>=0 AND val>10 THEN 
RAISE NOTICE 'Your value is between 0-10',val;
ELSIF val>=11 AND val>20 THEN 
RAISE NOTICE 'Your value is between 11-20',val;
ELSE 
RAISE NOTICE 'Your value is greater then 20',val;
END IF;
RAISE NOTICE 'You are inside end block';
END ;
$$