## A project written in 2017

It is a question-answering system for the field of vehicle maintenance, using Spring-SpringMVC-Mybatis back-end framework, Bootstrap front-end framework and Mysql structured database.

### The core business of the system:

1. A user inputs a question about vehicle maintenance in natural language;
2. The system reprocesses the question and segments it into several words;
3. The similarity is calculated between these words and the phrases in the database;
4. The system returns the three answers with the highest similarity value to the user.

### The processing of the knowledge database:

1. search domain knowledge on websites;
2. collect and save url,title,content into database;
3. segment each content into phrases;
4. extract 5 phrases as keywords from each content and save them as an attribute value;
5. attributes in the database: id,url,title,keywords,content.

### Models and tools used:
1. segmentation--CRF; tool--ansj
2. knowledge aquisition from websites--WebCollectCrawler; tool--WebCollectCrawler
3. keyword extraction--TFIDF; tool--ansj
4. similarity calculation--word2vec; tool--word2vec


```
- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/zdfan1007/QAS/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
