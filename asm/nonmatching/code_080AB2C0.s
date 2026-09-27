	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSoundRoomVolumeGraph
InitSoundRoomVolumeGraph: @ 0x080AB2C0
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080AB2F8 @ =0x08413C9C
	ldr r3, _080AB2FC @ =0x0201EA9C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080AB2CE:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080AB2CE
	ldr r1, _080AB300 @ =0x06010800
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080AB304 @ =0x08413D0C
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2F8: .4byte 0x08413C9C
_080AB2FC: .4byte 0x0201EA9C
_080AB300: .4byte 0x06010800
_080AB304: .4byte 0x08413D0C
