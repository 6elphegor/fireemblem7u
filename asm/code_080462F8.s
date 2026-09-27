	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080462F8
sub_080462F8: @ 0x080462F8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08046320 @ =0x0300141C
	ldr r2, _08046324 @ =sub_080462DC
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080463A4
	ldrb r0, [r4]
	cmp r0, #6
	beq _08046350
	cmp r0, #6
	bgt _08046328
	cmp r0, #1
	beq _0804632E
	b _080463A4
	.align 2, 0
_08046320: .4byte 0x0300141C
_08046324: .4byte sub_080462DC
_08046328:
	cmp r0, #7
	beq _0804638C
	b _080463A4
_0804632E:
	ldrb r0, [r4, #1]
	ldr r2, _0804634C @ =0x0203DCA0
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl sub_08044C10
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080463A4
	.align 2, 0
_0804634C: .4byte 0x0203DCA0
_08046350:
	bl EndLinkArenaPointsBox
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	ldr r1, _08046380 @ =0x0203D9AD
	adds r0, r0, r1
	ldr r1, _08046384 @ =0x03001438
	bl SioStrCpy
	ldr r0, _08046388 @ =0x08B99C68
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080463A4
	.align 2, 0
_08046380: .4byte 0x0203D9AD
_08046384: .4byte 0x03001438
_08046388: .4byte 0x08B99C68
_0804638C:
	bl EndLinkArenaPointsBox
	ldr r0, _080463B0 @ =0x08B99C88
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080463A4:
	bl sub_080462A4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080463B0: .4byte 0x08B99C88
