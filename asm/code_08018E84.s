	.include "macro.inc"

	.syntax unified

	thumb_func_start InitChapterPreviewMap
InitChapterPreviewMap: @ 0x08018E84
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _08018ED4 @ =0x02001000
	bl UnpackChapterMap
	ldr r0, _08018ED8 @ =0x0202E3F8
	ldr r6, _08018EDC @ =0x0202E3DC
	ldr r4, _08018EE0 @ =0x0202E3D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _08018EE4 @ =0x0202EBB0
	ldr r5, _08018EE8 @ =0x0202E3E0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	bl InitMetatilesMap
	bl RefreshTerrainMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018ED4: .4byte 0x02001000
_08018ED8: .4byte 0x0202E3F8
_08018EDC: .4byte 0x0202E3DC
_08018EE0: .4byte 0x0202E3D8
_08018EE4: .4byte 0x0202EBB0
_08018EE8: .4byte 0x0202E3E0
