	.include "macro.inc"

	.syntax unified

	thumb_func_start IsExtraLinkArenaEnabled
IsExtraLinkArenaEnabled: @ 0x0809EA80
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA94
	movs r0, #0
	b _0809EAB0
_0809EA90:
	movs r0, #1
	b _0809EAB0
_0809EA94:
	movs r4, #0
_0809EA96:
	adds r0, r4, #0
	bl IsGameSaveNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA90
	adds r4, #1
	cmp r4, #2
	ble _0809EA96
	bl IsMultiArenaSaveReady
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0809EAB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
