	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcShowMapChange_UpdateGame
ProcShowMapChange_UpdateGame: @ 0x0801EF90
	push {r4, lr}
	adds r4, r0, #0
	bl RenderMapForFade
	bl RefreshAutoWaterShadows
	bl RenderMap
	movs r0, #0
	bl StartMapFade
	ldr r0, [r4, #0x30]
	movs r2, #0xbd
	cmp r0, #0
	beq _0801EFB0
	movs r2, #0xbe
_0801EFB0:
	ldr r0, _0801EFC8 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	adds r0, r2, #0
	bl PlaySeSpacial
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EFC8: .4byte 0x0202BBB8
