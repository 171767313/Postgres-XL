/*-------------------------------------------------------------------------
 *
 * gtm_standby.h
 *
 *
 * Portions Copyright (c) 1996-2010, PostgreSQL Global Development Group
 * Portions Copyright (c) 1994, Regents of the University of California
 * Portions Copyright (c) 2010-2011 Nippon Telegraph and Telephone Corporation
 *
 * src/include/gtm/gtm_standby.h
 *
 *-------------------------------------------------------------------------
 */

#ifndef GTM_STANDBY_H
#define GTM_STANDBY_H

#include "c.h"
#include "gtm/gtm_c.h"
#include "gtm/libpq-fe.h"

/*
 * Variables to interact with GTM active under GTM standby mode.
 */
bool gtm_is_standby(void);
void gtm_set_standby(bool standby);
void gtm_set_active_conninfo(const char *addr, int port);

int gtm_standby_start_startup(void);
int gtm_standby_finish_startup(void);

int gtm_standby_restore_next_gxid(void);
int gtm_standby_restore_gxid(void);
int gtm_standby_restore_sequence(void);
int gtm_standby_restore_node(void);

int gtm_standby_register_self(GTM_PGXCNodeId nodenum, int port, const char *datadir);
int gtm_standby_activate_self(void);

GTM_Conn *gtm_standby_connect_to_standby(void);
void gtm_standby_disconnect_from_standby(GTM_Conn *conn);
GTM_Conn *gtm_standby_reconnect_to_standby(GTM_Conn *old_conn, int retry_max);
bool gtm_standby_check_communication_error(int *retry_count, GTM_Conn *oldconn);

#endif /* GTM_STANDBY_H */