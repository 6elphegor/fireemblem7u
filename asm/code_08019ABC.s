	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshEntityMaps
RefreshEntityMaps: @ 0x08019ABC
	push {lr}
	ldr r0, _08019AF8 @ =0x0202E3DC
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08019AFC @ =0x0202E3F0
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08019B00 @ =0x0202E3EC
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08019B04 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08019AE2
	movs r1, #1
_08019AE2:
	adds r0, r2, #0
	bl BmMapFillg
	bl RefreshTorchlightsOnBmMap
	bl RefreshUnitsOnBmMap
	bl RefreshMinesOnBmMap
	pop {r0}
	bx r0
	.align 2, 0
_08019AF8: .4byte 0x0202E3DC
_08019AFC: .4byte 0x0202E3F0
_08019B00: .4byte 0x0202E3EC
_08019B04: .4byte 0x0202BBF8
