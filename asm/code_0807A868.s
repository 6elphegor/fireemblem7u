	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A868
sub_0807A868: @ 0x0807A868
	push {r4, lr}
	movs r4, #0x41
_0807A86C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A884
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A884
	adds r0, r1, #0
	bl ClearUnit
_0807A884:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A86C
	pop {r4}
	pop {r0}
	bx r0
