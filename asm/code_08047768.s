	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047768
sub_08047768: @ 0x08047768
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080477AC @ =0x02022860
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080477B0 @ =0x08B9A250
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080477AC: .4byte 0x02022860
_080477B0: .4byte 0x08B9A250
