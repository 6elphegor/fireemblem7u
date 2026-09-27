	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3C58
sub_080B3C58: @ 0x080B3C58
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080B3C84 @ =0x44444444
	ldr r5, _080B3C88 @ =0x06014000
	movs r4, #3
_080B3C62:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080B3C8C @ =0x010000D8
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080B3C62
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3C84: .4byte 0x44444444
_080B3C88: .4byte 0x06014000
_080B3C8C: .4byte 0x010000D8
