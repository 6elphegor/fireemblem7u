	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepMuralBackground
StartPrepMuralBackground: @ 0x0809076C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _080907B4 @ =0x08407440
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080907B8 @ =0x0840D130
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080907BC @ =0x08CC436C
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2d
	strb r5, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080907B4: .4byte 0x08407440
_080907B8: .4byte 0x0840D130
_080907BC: .4byte 0x08CC436C
