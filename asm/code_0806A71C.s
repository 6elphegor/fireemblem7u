	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A71C
sub_0806A71C: @ 0x0806A71C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0806A742
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl NewEkrTriPegasusKnightOBJ
_0806A742:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x1c
	bne _0806A750
	adds r0, r5, #0
	movs r1, #6
	bl NewEfxFlashBgWhite
_0806A750:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x22
	bne _0806A782
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEkrTriPegasusKnightBG
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl NewEkrTriPegasusKnightOBJ
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806A782:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x33
	bne _0806A790
	adds r0, r5, #0
	movs r1, #6
	bl NewEfxFlashBgWhite
_0806A790:
	ldrh r3, [r4, #0x2c]
	cmp r3, #0x39
	bne _0806A7B6
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl NewEkrTriPegasusKnightBG
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
_0806A7B6:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x43
	bne _0806A7C8
	ldr r1, _0806A7D0 @ =0x02020134
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806A7C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7D0: .4byte 0x02020134
