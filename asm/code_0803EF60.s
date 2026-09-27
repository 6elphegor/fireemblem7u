	.include "macro.inc"

	.syntax unified

	thumb_func_start SioTeamList_StartEraseTeamSubMenu
SioTeamList_StartEraseTeamSubMenu: @ 0x0803EF60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_08049220
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, [r5, #0x40]
	ldrb r1, [r1]
	subs r0, r0, r1
	cmp r0, #2
	ble _0803EF84
	lsls r0, r0, #1
	subs r0, #2
	b _0803EF88
_0803EF84:
	lsls r0, r0, #1
	adds r0, #5
_0803EF88:
	str r0, [r5, #0x58]
	ldr r4, _0803EFB8 @ =0x0203D998
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0803EFBC @ =0x081D5270
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _0803EFC0 @ =0x02022C7E
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803EFB8: .4byte 0x0203D998
_0803EFBC: .4byte 0x081D5270
_0803EFC0: .4byte 0x02022C7E
