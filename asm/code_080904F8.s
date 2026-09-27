	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMenuScrollBarImg
InitMenuScrollBarImg: @ 0x080904F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08090530 @ =0x08405734
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08090534 @ =0x08405690
	ldr r2, _08090538 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _0809053C @ =0x08CC4334
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08090528
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08090528:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090530: .4byte 0x08405734
_08090534: .4byte 0x08405690
_08090538: .4byte 0x06010000
_0809053C: .4byte 0x08CC4334
