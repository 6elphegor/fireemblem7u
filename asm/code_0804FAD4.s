	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FAD4
sub_0804FAD4: @ 0x0804FAD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq _0804FB32
	bl InitIcons
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FAFA
	str r0, [r4, #0x4c]
_0804FAFA:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0804FB14
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	ldr r0, _0804FB38 @ =0x02022860
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl EfxPalWhiteInOut
_0804FB14:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0804FB2E
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804FB38 @ =0x02022860
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl EfxPalWhiteInOut
_0804FB2E:
	bl EnablePalSync
_0804FB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB38: .4byte 0x02022860
