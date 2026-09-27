	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateRuleSettingSprites
UpdateRuleSettingSprites: @ 0x080488CC
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr
