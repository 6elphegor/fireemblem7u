	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_CgBackground
EvtCmd_CgBackground: @ 0x08010064
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08010080
	movs r0, #0
	b _080100C2
_08010080:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010098
	bl LockBmDisplay
	bl LockMus
_08010098:
	movs r0, #0x61
	strb r0, [r4]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080100CC @ =0x02024460
	str r5, [sp]
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
_080100C2:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080100CC: .4byte 0x02024460
