	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACF08
sub_080ACF08: @ 0x080ACF08
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r1, #6
	movs r2, #0x12
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	movs r1, #0x11
	movs r2, #0xa
	movs r3, #3
	bl DrawUiFrame2
	ldr r4, _080ACF58 @ =0x02023112
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACF58: .4byte 0x02023112
