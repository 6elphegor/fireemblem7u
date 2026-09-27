	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A8E4
sub_0809A8E4: @ 0x0809A8E4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_0808F808
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_0809A8FE:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _0809A920 @ =0x08B905F8
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809A8FE
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A920: .4byte 0x08B905F8
