	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B303C
sub_080B303C: @ 0x080B303C
	push {r4, lr}
	ldr r2, _080B3064 @ =0x0200000C
	ldr r4, _080B3068 @ =0x00000802
	adds r3, r2, r4
	ldrh r4, [r3]
	adds r0, r4, r0
	strh r0, [r3]
	ldr r0, _080B306C @ =0x00000804
	adds r2, r2, r0
	ldrh r4, [r2]
	adds r1, r4, r1
	strh r1, [r2]
	ldrh r1, [r3]
	ldrh r2, [r2]
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3064: .4byte 0x0200000C
_080B3068: .4byte 0x00000802
_080B306C: .4byte 0x00000804
