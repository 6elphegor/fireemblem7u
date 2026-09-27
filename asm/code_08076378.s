	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076378
sub_08076378: @ 0x08076378
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080763A8 @ =0x0203E0FC
	ldr r2, _080763A8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _080763AC @ =0x083F6334
	ldr r2, _080763B0 @ =0x083F695C
	movs r3, #0x89
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763A8: .4byte 0x0203E0FC
_080763AC: .4byte 0x083F6334
_080763B0: .4byte 0x083F695C
