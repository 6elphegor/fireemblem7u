	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshAutoWaterShadows
RefreshAutoWaterShadows: @ 0x08019040
	push {lr}
	ldr r0, _08019064 @ =0x02001000
	ldr r1, _08019068 @ =0x0202BBF8
	ldrb r1, [r1, #0xe]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnpackChapterMap
	bl InitMetatilesMap
	bl ApplyEnabledMapChanges
	bl RefreshTerrainMap
	bl ApplyAutoWaterShadows
	pop {r0}
	bx r0
	.align 2, 0
_08019064: .4byte 0x02001000
_08019068: .4byte 0x0202BBF8
