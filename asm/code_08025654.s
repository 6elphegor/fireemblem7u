	.include "macro.inc"

	.syntax unified

	thumb_func_start SetStandingMuFacing
SetStandingMuFacing: @ 0x08025654
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _0802567C
	cmp r0, #0x23
	ble _08025678
	ldr r2, _08025674 @ =0x02037F14
	b _0802568A
	.align 2, 0
_08025674: .4byte 0x02037F14
_08025678:
	cmp r0, #0x1f
	ble _08025684
_0802567C:
	ldr r2, _08025680 @ =0x02035F14
	b _0802568A
	.align 2, 0
_08025680: .4byte 0x02035F14
_08025684:
	cmp r1, #0
	blt _0802568A
	ldr r2, _080256C0 @ =0x02033F14
_0802568A:
	cmp r2, #0
	beq _080256BA
	ldr r1, _080256C4 @ =0x08B93E48
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_080256A2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _080256A2
_080256BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080256C0: .4byte 0x02033F14
_080256C4: .4byte 0x08B93E48
