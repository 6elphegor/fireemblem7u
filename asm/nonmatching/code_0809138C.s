	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_DrawFunds
PrepItemScreen_DrawFunds: @ 0x0809138C
	push {r4, r5, lr}
	ldr r0, _080913D0 @ =0x02012A90
	ldr r4, _080913D4 @ =0x020230C6
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x12
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x14
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0
	movs r1, #0x88
	movs r2, #0x8b
	movs r3, #2
	bl EnableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080913D0: .4byte 0x02012A90
_080913D4: .4byte 0x020230C6
