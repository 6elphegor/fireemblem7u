	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBattleForecastTilemaps
PutBattleForecastTilemaps: @ 0x08033C38
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x32
	movs r4, #0x14
	ldrb r1, [r1]
	cmp r1, #1
	bne _08033C48
	movs r4, #0x10
_08033C48:
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08033C80
	ldr r0, _08033C70 @ =0x0200323C
	ldr r1, _08033C74 @ =0x02022C60
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, _08033C78 @ =0x0200373C
	ldr r1, _08033C7C @ =0x02023460
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	b _08033C98
	.align 2, 0
_08033C70: .4byte 0x0200323C
_08033C74: .4byte 0x02022C60
_08033C78: .4byte 0x0200373C
_08033C7C: .4byte 0x02023460
_08033C80:
	ldr r0, _08033CA4 @ =0x0200323C
	ldr r1, _08033CA8 @ =0x02022C88
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, _08033CAC @ =0x0200373C
	ldr r1, _08033CB0 @ =0x02023488
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
_08033C98:
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033CA4: .4byte 0x0200323C
_08033CA8: .4byte 0x02022C88
_08033CAC: .4byte 0x0200373C
_08033CB0: .4byte 0x02023488
