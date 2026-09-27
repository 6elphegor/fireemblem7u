	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080714A0
sub_080714A0: @ 0x080714A0
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _0807150C @ =0x083F2DA4
	ldr r1, _08071510 @ =0x06013000
	bl Decompress
	ldr r0, _08071514 @ =0x083F2EE8
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08071518 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	ldr r3, [r7]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _08071518 @ =0x0202BBB8
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	adds r2, r3, #0
	lsls r3, r2, #3
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807150C: .4byte 0x083F2DA4
_08071510: .4byte 0x06013000
_08071514: .4byte 0x083F2EE8
_08071518: .4byte 0x0202BBB8
