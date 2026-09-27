	.include "macro.inc"

	.syntax unified

	thumb_func_start SetAnimStateHidden
SetAnimStateHidden: @ 0x0805484C
	cmp r0, #0
	bne _08054864
	ldr r2, _08054860 @ =0x02000000
	ldr r3, [r2]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _08054876
	.align 2, 0
_08054860: .4byte 0x02000000
_08054864:
	cmp r0, #1
	bne _0805487C
	ldr r2, _08054880 @ =0x02000000
	ldr r3, [r2, #8]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_08054876:
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
_0805487C:
	bx lr
	.align 2, 0
_08054880: .4byte 0x02000000
