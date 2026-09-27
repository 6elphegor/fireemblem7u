	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A8120
sub_080A8120: @ 0x080A8120
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A8142
	ldr r5, _080A814C @ =0x0201E8D4
	adds r6, r0, #0
_080A8132:
	adds r0, r5, #0
	bl sub_08054E5C
	adds r5, #0x38
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A8132
_080A8142:
	movs r0, #0
	str r0, [r7, #0x50]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A814C: .4byte 0x0201E8D4
