	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC790
sub_080BC790: @ 0x080BC790
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080BC7D8 @ =0x02007018
	ldr r0, [r2, #8]
	ldr r1, _080BC7DC @ =0x000005FF
	cmp r0, r1
	bgt _080BC7A6
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	str r0, [r2, #8]
_080BC7A6:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	bgt _080BC7B0
	adds r0, #0x20
	str r0, [r2, #0xc]
_080BC7B0:
	ldr r1, [r2, #0x10]
	ldr r0, _080BC7E0 @ =0x000008FF
	cmp r1, r0
	bgt _080BC7BE
	adds r0, r1, #0
	adds r0, #0x20
	str r0, [r2, #0x10]
_080BC7BE:
	adds r0, r4, #0
	bl sub_080BC6A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC7D0
	adds r0, r4, #0
	bl Proc_Break
_080BC7D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC7D8: .4byte 0x02007018
_080BC7DC: .4byte 0x000005FF
_080BC7E0: .4byte 0x000008FF
