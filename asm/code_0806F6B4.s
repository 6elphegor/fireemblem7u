	.include "macro.inc"

	.syntax unified

	thumb_func_start PutManimWindowBar
PutManimWindowBar: @ 0x0806F6B4
	push {r4, r7, lr}
	sub sp, #0x20
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806F6CA:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806F6D4
	b _0806F6E8
_0806F6D4:
	ldr r1, [r7, #0x14]
	subs r0, r1, #1
	ldr r1, [r7, #0x18]
	ldrh r2, [r1]
	adds r0, r0, r2
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806F6CA
_0806F6E8:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	bne _0806F6FC
	ldr r0, [r7, #0x14]
	str r0, [r7, #0x10]
	b _0806F710
_0806F6FC:
	ldr r0, [r7, #0x14]
	lsls r1, r0, #8
	adds r0, r1, #0
	ldr r1, [r7, #4]
	bl __divsi3
	ldr r1, [r7, #8]
	muls r0, r1, r0
	asrs r1, r0, #8
	str r1, [r7, #0x10]
_0806F710:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _0806F722
	ldr r0, [r7, #8]
	cmp r0, #0
	ble _0806F722
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_0806F722:
	ldr r0, [r7, #0x28]
	str r0, [r7, #0x18]
_0806F726:
	ldr r0, [r7, #0x18]
	ldrh r1, [r0]
	cmp r1, #0
	bne _0806F730
	b _0806F764
_0806F730:
	adds r1, r7, #0
	adds r1, #0x10
	ldr r0, _0806F760 @ =0x08C9D790
	ldr r2, [r7, #0xc]
	adds r3, r2, #0
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r7, #0x18]
	ldrh r3, [r0]
	ldr r4, [r7, #0x18]
	adds r0, r4, #2
	ldrh r4, [r0]
	str r4, [sp]
	ldr r0, [r7]
	bl PutManimWindowBarTile
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x18]
	adds r1, r0, #4
	str r1, [r7, #0x18]
	b _0806F726
	.align 2, 0
_0806F760: .4byte 0x08C9D790
_0806F764:
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0
