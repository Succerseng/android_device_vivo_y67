#include <stdint.h>
#include <media/IMediaSource.h>
#include <media/stagefright/MediaSource.h>

extern "C"{
    extern void _ZNK7android11MediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE(void * obj, int64_t time_us, android::MediaSource::ReadOptions::SeekMode mode) {
        android::IMediaSource::ReadOptions *rop = static_cast<android::IMediaSource::ReadOptions *>(obj);
        rop->setSeekTo(time_us, mode);
    }

    extern bool _ZNK7android11MediaSource11ReadOptions14getNonBlockingEv(void * obj) {
        android::IMediaSource::ReadOptions *rop = static_cast<android::IMediaSource::ReadOptions *>(obj);
        return rop->getNonBlocking();
    }

    int64_t _ZNK7android11MediaSource11ReadOptions9getLateByEv(android::IMediaSource::ReadOptions *readOptions) {
        int64_t res = readOptions->getLateBy();
        return res;
    }
    int _ZN7android16MediaBufferGroupC1Ev(){
        return 0;
    }
    char _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb(){
        return 0;
    }
    char EVP_PKEY_new_mac_key(){
        return 0;
    }
    char _ZN7android15IsWidevineMediaERKNS_2spINS_10DataSourceEEE(){
    return 0;}
}
