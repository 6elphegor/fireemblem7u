	.include "macro.inc"

	.syntax unified

	thumb_func_start InitChapterMap
InitChapterMap: @ 0x08018D88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08018E40 @ =0x02001000
	adds r1, r4, #0
	bl UnpackChapterMap
	adds r0, r4, #0
	bl UnpackChapterMapGraphics
	ldr r0, _08018E44 @ =0x0202E3F8
	ldr r6, _08018E48 @ =0x0202E3DC
	ldr r4, _08018E4C @ =0x0202E3D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _08018E50 @ =0x0202EBB0
	ldr r5, _08018E54 @ =0x0202E3E0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r7, #2
	ldrsh r3, [r4, r7]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, _08018E58 @ =0x03000440
	ldr r1, _08018E5C @ =0x0202E3E4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08018E60 @ =0x03000BF8
	ldr r1, _08018E64 @ =0x0202E3E8
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08018E68 @ =0x0202F368
	ldr r1, _08018E6C @ =0x0202E3EC
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08018E70 @ =0x0202FB20
	ldr r1, _08018E74 @ =0x0202E3F0
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, _08018E78 @ =0x020302D8
	ldr r1, _08018E7C @ =0x0202E3F4
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r7, #2
	ldrsh r3, [r4, r7]
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	bl InitMetatilesMap
	bl ApplyEnabledMapChanges
	bl RefreshTerrainMap
	ldr r0, _08018E80 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x26
	bne _08018E38
	bl ApplyAutoWaterShadows
_08018E38:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018E40: .4byte 0x02001000
_08018E44: .4byte 0x0202E3F8
_08018E48: .4byte 0x0202E3DC
_08018E4C: .4byte 0x0202E3D8
_08018E50: .4byte 0x0202EBB0
_08018E54: .4byte 0x0202E3E0
_08018E58: .4byte 0x03000440
_08018E5C: .4byte 0x0202E3E4
_08018E60: .4byte 0x03000BF8
_08018E64: .4byte 0x0202E3E8
_08018E68: .4byte 0x0202F368
_08018E6C: .4byte 0x0202E3EC
_08018E70: .4byte 0x0202FB20
_08018E74: .4byte 0x0202E3F0
_08018E78: .4byte 0x020302D8
_08018E7C: .4byte 0x0202E3F4
_08018E80: .4byte 0x0202BBF8
