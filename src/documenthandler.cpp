#include "includes/documenthandler.h"
#include <QDebug>
#include "includes/storageinterface.h"

DocumentHandler::DocumentHandler(QObject *parent) : QObject(parent)
{
}

void DocumentHandler::setTextDocument(QQuickTextDocument *textdoc)
{
    m_textDocument = textdoc;
    connect(m_textDocument->textDocument(), SIGNAL(contentsChanged()), this, SLOT(change()));
}

QQuickTextDocument* DocumentHandler::getTextDocument()
{
    return m_textDocument;
}

void DocumentHandler::change()
{
    emit contentsChanged(m_textDocument->textDocument()->toHtml());
}

QString DocumentHandler::getDocumentHtml()
{
    return m_textDocument->textDocument()->toHtml();
}

void DocumentHandler::setNode(QVariant node)
{
    if (!node.canConvert<QDomElement*>()) {
        qDebug() << "Conversion failure";
    }
    QDomElement* tempElement = qvariant_cast<QDomElement*>(node);
    m_containerElement = tempElement;
}

QVariant DocumentHandler::getNode()
{
    return QVariant::fromValue(m_containerElement);
}

double DocumentHandler::getXPos()
{
    return m_xpos;
}

void DocumentHandler::setXPos(double xpos)
{
    m_xpos = xpos;
    m_containerElement->setAttribute("XPos", m_xpos);
    emit xPositionChanged(m_xpos);
}

double DocumentHandler::getYPos()
{
    return m_ypos;
}

void DocumentHandler::setYPos(double ypos)
{
    m_ypos = ypos;
    m_containerElement->setAttribute("YPos", m_ypos);
    emit yPositionChanged(m_ypos);
}

DocumentHandler::~DocumentHandler()
{
    delete m_containerElement;
}
