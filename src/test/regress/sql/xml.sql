CREATE TABLE xmltest (
    id int,
    data xml
);

INSERT INTO xmltest VALUES (1, '<value>one</value>');
INSERT INTO xmltest VALUES (2, '<value>two</value>');
INSERT INTO xmltest VALUES (3, '<wrong');

SELECT * FROM xmltest;


SELECT xmlcomment('test');
SELECT xmlcomment('-test');
SELECT xmlcomment('test-');
SELECT xmlcomment('--test');
SELECT xmlcomment('te st');


SELECT xmlconcat(xmlcomment('hello'),
                 xmlelement(NAME qux, 'foo'),
                 xmlcomment('world'));

SELECT xmlconcat('hello', 'you');
SELECT xmlconcat(1, 2);
SELECT xmlconcat('bad', '<syntax');


SELECT xmlelement(name element,
                  xmlattributes (1 as one, 'deuce' as two),
                  'content');

SELECT xmlelement(name element,
                  xmlattributes ('unnamed and wrong'));

SELECT xmlelement(name element, xmlelement(name nested, 'stuff'));

SELECT xmlelement(name employee, xmlforest(name, age, salary as pay)) FROM emp;

SELECT xmlelement(name wrong, 37);


SELECT xmlparse(content 'abc');
SELECT xmlparse(content '<abc>x</abc>');

SELECT xmlparse(document 'abc');
SELECT xmlparse(document '<abc>x</abc>');


SELECT xmlpi(name foo);
SELECT xmlpi(name xmlstuff);
SELECT xmlpi(name foo, 'bar');
SELECT xmlpi(name foo, 'in?>valid');

SELECT xmlroot(xml '<foo/>', version no value, standalone no value);
SELECT xmlroot(xml '<foo/>', version '2.0');
SELECT xmlroot(xmlroot(xml '<foo/>', version '1.0'), version '1.1', standalone no);

SELECT xmlroot (
  xmlelement (
    name gazonk,
    xmlattributes (
      'val' AS name,
      1 + 1 AS num
    ),
    xmlelement (
      NAME qux,
      'foo'
    )
  ),
  version '1.0',
  standalone yes
);


SELECT xmlserialize(content data as character varying) FROM xmltest;


-- Check mapping SQL identifier to XML name

SELECT xmlpi(name ":::_xml_abc135.%-&_");
SELECT xmlpi(name "123");