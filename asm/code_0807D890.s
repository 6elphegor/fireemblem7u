	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D890
sub_0807D890: @ 0x0807D890
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D8C6
	ldr r0, _0807D8D0 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r5, [r0, r1]
	movs r1, #0x7f
	subs r1, r1, r5
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	movs r2, #0x18
	subs r2, r2, r4
	movs r3, #0x87
	subs r3, r3, r5
	movs r0, #0x30
	subs r0, r0, r4
	str r0, [sp]
	adds r0, r6, #0
	bl StartEmitStarsAnim
_0807D8C6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8D0: .4byte 0x0202BBB8
