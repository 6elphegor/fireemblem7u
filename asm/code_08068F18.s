	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_DrawUnitName
EkrLvup_DrawUnitName: @ 0x08068F18
	push {r4, lr}
	ldr r4, _08068F44 @ =0x020176E0
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08068F48 @ =0x02020100
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08068F4C @ =0x02023E24
	adds r0, r4, #0
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F44: .4byte 0x020176E0
_08068F48: .4byte 0x02020100
_08068F4C: .4byte 0x02023E24
