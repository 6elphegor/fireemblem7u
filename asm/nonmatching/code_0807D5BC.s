	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D5BC
sub_0807D5BC: @ 0x0807D5BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D600
	movs r0, #0x5b
	bl GetUnitFromCharId
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r3, _0807D608 @ =0x0202BBB8
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r2, #8
	subs r1, r1, r2
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	lsls r2, r2, #4
	movs r5, #0xe
	ldrsh r0, [r3, r5]
	subs r0, #8
	subs r2, r2, r0
	adds r0, r4, #0
	bl sub_08020D6C
	adds r1, r4, #0
	adds r1, #0x4d
	movs r0, #1
	strb r0, [r1]
_0807D600:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D608: .4byte 0x0202BBB8
