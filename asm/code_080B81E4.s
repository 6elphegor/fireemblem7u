	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B81E4
sub_080B81E4: @ 0x080B81E4
	push {r4, r5, r6, r7, lr}
	bl ResetText
	ldr r7, _080B822C @ =0x08CEE868
	movs r6, #0x38
	movs r5, #0x28
	movs r4, #1
_080B81F2:
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #0xf
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xa
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B81F2
	movs r4, #0
	ldr r5, _080B822C @ =0x08CEE868
_080B8214:
	lsls r1, r4, #3
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0x19
	bl InitText
	adds r4, #1
	cmp r4, #4
	ble _080B8214
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B822C: .4byte 0x08CEE868
