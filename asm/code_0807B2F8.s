	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B2F8
sub_0807B2F8: @ 0x0807B2F8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r3, r0, #0
	ldr r2, _0807B340 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r3, r3, r0
	ldr r5, _0807B344 @ =0x000001FF
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r1, r1, r0
	movs r4, #0xff
	ldr r0, _0807B348 @ =0x08197CC8
	ldr r6, _0807B34C @ =0x08198164
	ldr r2, _0807B350 @ =0x08198838
	ands r3, r5
	ands r1, r4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r1, #0xd0
	lsls r1, r1, #3
	str r1, [sp, #0x10]
	movs r1, #4
	str r1, [sp, #0x14]
	adds r1, r6, #0
	bl StartSpriteAnimfx
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B340: .4byte 0x0202BBB8
_0807B344: .4byte 0x000001FF
_0807B348: .4byte 0x08197CC8
_0807B34C: .4byte 0x08198164
_0807B350: .4byte 0x08198838
